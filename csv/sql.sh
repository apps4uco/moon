
for file in "4/2012-11-15/2012-11-28" "4/2012-11-01/2012-11-14" "4/2012-10-18/2012-10-31" "3/2012-05-18/2012-05-28" "3/2012-05-04/2012-05-18" "3/2012-04-19/2012-05-04" "3/2012-04-04/2012-04-18" "3/2012-03-22/2012-04-04" "3/2012-03-15/2012-03-21"
do
filename=$(echo $file | tr / _ | tr -d -)
echo "copy image (image_id,center_lng,center_lat,nadir_lng,nadir_lat,corner1_lng,corner1_lat,corner2_lng,corner2_lat,corner3_lng,corner3_lat,corner4_lng,corner4_lat,altitude,lens_size,frame_width,frame_height,taken_utc,mission_name,spacecraft,camera_dir,orbit_num,image_page,image_link,kml_link,schools) from '/tmp/$filename.csv' delimiter ',' CSV HEADER;"
done

