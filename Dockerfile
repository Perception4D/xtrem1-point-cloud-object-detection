FROM basicai/xtreme1-openpcdet

WORKDIR /app
RUN wget https://basicai-asset.s3.us-west-2.amazonaws.com/xtreme1/model/cbgs_voxel0075_centerpoint_nds_6648.pth
COPY . ./
RUN pip install -e .

WORKDIR /app/pcdet_open
ENTRYPOINT ["python", "app.py", "../cbgs_voxel0075_centerpoint_nds_6648.pth"]
EXPOSE 5000