FROM rocm/pytorch:latest

# ADD build /build
# WORKDIR /build
#ARG huggingface_api_key
#ENV huggingface_api_key=$huggingface_api_key
COPY requirements.txt .
EXPOSE 8888
RUN pip install -r requirements.txt
#CMD [ "jupyter", "notebook", "--ip", "0.0.0.0", "--no-browser ", "--allow-root" ]