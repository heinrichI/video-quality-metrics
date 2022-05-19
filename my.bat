REM создание среды
REM c:\Python39\python.exe -m venv environment
REM c:\SourceDeep\Vietnamese-Celebrity-Face-Recognition\environment\Scripts\python.exe -m venv environment
F:
cd f:\E\SourceDeep\VMAF_\video-quality-metrics\
f:\E\SourceDeep\VMAF_\video-quality-metrics\environment\Scripts\activate.bat

pip install numpy prettytable ffmpeg-python matplotlib tqdm

f:\E\SourceDeep\VMAF_\video-quality-metrics\environment\Scripts\python.exe main.py
-ntm -ovp i:\Coding\Meksikanec.2001.BDRemux.3xRUS.ENG.mkv -tvp i:\Coding\Meksikanec.2001.BDRip_new.mkv -ssim -psnr

python main.py -ovp i:\Coding\Meksikanec.2001.BDRemux.3xRUS.ENG.mkv -p slow slower -crf 18 -ssim -psnr -e x264 --n-threads 32 --interval 60 --clip-length 1

python main.py -ovp i:\Coding\Meksikanec.2001.BDRemux.3xRUS.ENG.mkv -p slow slower -crf 18 -ssim -psnr -e x265 --n-threads 32 --interval 60 --clip-length 1