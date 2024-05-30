
## Purpose :1.set 2-km buffer along the Doubs river and clip from the map to extract the raster values of the catchment area and slope for each point with the qgisprocess package.
            2.merge the extracted data with other environmental factors from Doubs dataset to form a dataframe, and finally transfer the dataframe to a sf object, which contains a geometry column.
## Author: Pengcheng Xiong
## 
## Emai: esteldarwin@mail.ustc.edu.cn

#读取数据
doubs_dem <- terra::rast("E:/xpc-data//homework//map//map.tif")
doubs_river <- sf::st_read("E:/xpc-data//homework//map//river.shp")
doubs_points <- sf::st_read("E:/xpc-data//homework//map//points.shp")


doubs_river_utm <- st_transform(doubs_river,32631)
doubs_points_pts<-st_transform(doubs_points,32631)
utm_crs <- "EPSG:32631"
doubs_dem_utm <- terra::project(doubs_dem,utm_crs)
terra::crs(doubs_dem_utm)


doubs_buffered <- st_buffer(doubs_river, dist = 2000)
plot(st_geometry(doubs_buffered),axes=TRUE)

doubs_dem <- qgis_runalg(qgis, "grass8:r.watershed", "E:/NTKC/QGIS/doubs_dem.tif", doubs_buffered$cat)
doubs_slope <- qgis_runalg(qgis, "grass8:r.slope.aspect", "E:/NTKC//QGIS/doubs_dem.tif", doubs_buffered$cat)

dem_values <- terra::extract(doubs_dem, doubs)
slope_values <- terra::extract(doubs_slope, doubs)


data_frame <- merge(doubs,data.frame(DEMValue = dem_values, SlopeValue = slope_values), 
                    by = "cat",all.y = TRUE)


sf_object <- st_as_sf(data_frame, coords = c("经度", "纬度"),crs = 4326)

#可视化
ggplot() +
geom_sf(data = sf_object, aes(fill = DEMValue)) + 
  theme_minimal()
