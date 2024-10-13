# rocm-ml
Run transformers on AMD GPUs via ROCm

## Usage

To build:

```sh
docker build . -t rocm-ml
```

To run:

```sh
sudo docker run -it -p 8888:8888  -v ./notebooks:/notebooks -w /notebooks --cap-add=SYS_PTRACE --security-opt seccomp=unconfined \
--device=/dev/kfd --device=/dev/dri --group-add video \
--ipc=host --shm-size 8G rocm-ml
```

This command mounts the [notebooks](notebooks) folder within the docker container. I recommend only editing within a jupyter notebook running on the docker container.


Command to start jupyter within docker container:

```sh
jupyter notebook --ip 0.0.0.0 --no-browser --allow-root
```

## References

- [AMD Instructions for using ROCm via Docker](https://rocm.docs.amd.com/projects/install-on-linux/en/latest/install/3rd-party/pytorch-install.html#using-a-docker-image-with-pytorch-pre-installed) - the docker run command above is based on this page
- [Docker run](https://docs.docker.com/reference/cli/docker/container/run/)
    - [Bind volumes arg (`-v`)](https://docs.docker.com/reference/cli/docker/container/run/#volume)
- [Running Jupyter with Docker](https://deepnote.com/guides/jupyter/how-to-run-jupyter-in-docker) - The `p` argument in the docker run command above is from here


## Todo

- Try out [different text to image models](https://huggingface.co/models?pipeline_tag=text-to-image&sort=trending)