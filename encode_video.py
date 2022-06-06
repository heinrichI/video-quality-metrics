from ffmpeg_process_factory import EncodingArguments, FfmpegProcessFactory
from utils import Logger, Timer
from typing import Tuple

log = Logger("encode_video.py")


def encode_video(video_path : str, args : str, crf, preset : str, output_path : str, message : str, duration) -> Tuple[FfmpegProcessFactory, str]:
    arguments = EncodingArguments(video_path, args.video_encoder, output_path, args.custom_presets_mode)

    if args.video_encoder == "libaom-av1":
        arguments.av1_cpu_used(str(args.av1_cpu_used))

    arguments.crf(str(crf))
    arguments.preset(preset)
    video_filters = args.video_filters if args.video_filters else None
    arguments.video_filters(video_filters)

    factory = FfmpegProcessFactory()
    process = factory.create_process(arguments, args)

    log.info(f"Converting the video using {message}...")
    timer = Timer()
    timer.start()
    process.run(video_path, duration)
    time_taken = timer.stop(args.decimal_places)
    log.info("Done!")

    return factory, time_taken
