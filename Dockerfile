FROM python:3.7


ADD requirements.txt /requirements.txt

RUN pip install -r /requirements.txt

RUN pip install jupyter_contrib_nbextensions && \
    jupyter contrib nbextension install --user && \
    pip install jupyter_nbextensions_configurator && \
    jupyter nbextensions_configurator enable --user && \
    pip install jupyterlab

RUN apt-get update && apt-get install -y nodejs npm && \
    pip install ipympl && \
    jupyter labextension install @jupyter-widgets/jupyterlab-manager && \
    jupyter labextension install jupyter-matplotlib

WORKDIR /data

CMD ["jupyter", "lab", "--allow-root", "--ip", "0.0.0.0", "--notebook-dir", "/data", "--no-browser"]
