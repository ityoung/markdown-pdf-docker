FROM node:8

LABEL author.name="Shin" \
      author.email="ityoung@foxmail.com" \
      version="1.0.0" \
      description="Convert markdown to PDF."

# Chinese fonts support
ENV LANG="C.UTF-8"

RUN sed -i 's/deb.debian.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apt/sources.list \
  && sed -i 's/security.debian.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apt/sources.list \
  && apt-get update -y \
  && apt-get install -y libfontconfig1 fonts-ipafont-gothic fonts-wqy-zenhei fonts-thai-tlwg fonts-kacst ttf-freefont

# Speed up Downloading PhantomJS
ARG PHANTOMJS_CDNURL="https://npm.taobao.org/dist/phantomjs"

RUN npm config set registry https://registry.npm.taobao.org \
  && npm install -g markdown-pdf --unsafe-perm

VOLUME /mdpdf
WORKDIR /mdpdf

ENTRYPOINT ["markdown-pdf"]
