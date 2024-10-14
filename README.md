# rocm-ml

This repository builds a docker image to leverage AMD graphics cards for machine learning using the RoCM drivers. These instructions are designed for Linux. I am using Pop OS! and installed the RoCM drivers with [these instructions](https://support.system76.com/articles/rocm/).

## Usage

To use a gated model such as stable diffusion 3, you must define the environmental variable `huggingface_api_key`. You can do this by adding the following line to your `~/.bashrc` file:

```sh
export huggingface_api_key=Put_API_Key_Here_With_No_Quotes_Or_Spaces

To build:

```sh
docker build . -t rocm-ml
```

To run:

```sh
sudo -E docker run --env huggingface_api_key -it -p 8888:8888  -v ./notebooks:/notebooks -w /notebooks --cap-add=SYS_PTRACE --security-opt seccomp=unconfined \
--device=/dev/kfd --device=/dev/dri --group-add video \
--ipc=host --shm-size 8G rocm-ml 
```

- This command mounts the [notebooks](notebooks) folder within the docker container. I recommend only editing within a jupyter notebook running on the docker container.
- The `-E` argument for sudo is key to transfer the environmental variable `huggingface_api_key` from the user's environment to the root user

Command to start jupyter within docker container:

```sh
jupyter notebook --ip 0.0.0.0 --no-browser --allow-root --NotebookApp.token='' --NotebookApp.password=''
```

## References

- [AMD Instructions for using ROCm via Docker](https://rocm.docs.amd.com/projects/install-on-linux/en/latest/install/3rd-party/pytorch-install.html#using-a-docker-image-with-pytorch-pre-installed) - the docker run command above is based on this page
- [Docker run](https://docs.docker.com/reference/cli/docker/container/run/)
    - [Bind volumes arg (`-v`)](https://docs.docker.com/reference/cli/docker/container/run/#volume)
- [Running Jupyter with Docker](https://deepnote.com/guides/jupyter/how-to-run-jupyter-in-docker) - The `p` argument in the docker run command above is from here


## Todo

- Try out [different text to image models](https://huggingface.co/models?pipeline_tag=text-to-image&sort=trending)
- Make jupyter server start automatically
- Makefile or docker compose for build process?
- Fix issue with jupyther authentication