FROM p4d-xtrem1-point-cloud-object-detection-base

#RUN pip install -U numpy==1.23.5

WORKDIR /app
RUN wget https://basicai-asset.s3.us-west-2.amazonaws.com/xtreme1/model/cbgs_voxel0075_centerpoint_nds_6648.pth
COPY . ./
RUN pip install -e .

WORKDIR /app/pcdet_open
CMD ["python", "app.py", "../cbgs_voxel0075_centerpoint_nds_6648.pth"]
EXPOSE 5000
