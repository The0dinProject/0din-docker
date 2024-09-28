FROM pastagringo/0din-base:latest
RUN git clone https://github.com/The0dinProject/0din /app/0din
COPY entrypoint.sh /app/0din
WORKDIR /app/0din
RUN pip install -r requirements.txt
ENTRYPOINT [ "/app/0din/entrypoint.sh" ]
