FROM rust:latest

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y && \
		apt-get install -y cmake pkg-config \
			libxcursor-dev libxrandr-dev libxi-dev libx11-xcb-dev \
			libgl1-mesa-dev mesa-utils libgl1-mesa-glx \
			libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev python3

COPY . .

WORKDIR alacritty/alacritty

RUN cargo build

CMD ["cargo", "run"]
