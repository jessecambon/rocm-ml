FROM rocm/pytorch:latest

ADD build /build
WORKDIR /build
COPY requirements.txt .
RUN pip install -r requirements.txt
CMD jupyter notebook --allow-root