#docker run alpine
#sudo apt-get update
#sudo apt-get install -y python3 python3-pip git
#sudo pip3 install plotly
# python3
# import plotly

#FROM ubuntu
FROM alpine

RUN sudo apt-get update
RUN sudo apt-get install -y \
    python3 \
    python3-pip \
    git \
    && true
RUN sudo pip3 install plotly

#RUN mkdir ~/.plotly
#COPY * /speedtest-cli/
#python ./speedtest.py --plotly

RUN git clone https://github.com/akanack/rpi-speedtest-plotly-mine.git
RUN mv speedtest-plotly-mine rpi-speedtest-plotly-mine

# grab /.plotly/.config and .credentials locally else need to -v mount at docker run time
#COPY /.plotly /root/.plotly
CMD ["python3", "speedtest.py", "--plotly"]
