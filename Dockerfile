# Используем базовый образ с поддержкой conda
FROM continuumio/miniconda3

# Установка основных зависимостей через conda
RUN conda install -c conda-forge -c defaults \
    python=3.11 \
    pip \
    wheel \
    ipykernel \
    ipython \
    ipython_genutils \
    jupyter \
    jupyter_client \
    jupyter_console \
    jupyter_core \
    jupyterlab \
    jupyterlab_server \
    requests \
    nest-asyncio \
    && conda clean --all -y

# Создание директории для окружения
RUN mkdir -p /opt/conda

# Установка зависимостей через pip
RUN pip install \
    beautifulsoup4 \
    matplotlib \
    nltk \
    numpy \
    pandas \
    plotly \
    psycopg2-binary \
    regex \
    scikit-learn \
    scipy \
    seaborn \
    sqlalchemy \
    statsmodels \
    catboost \
    pyspark \
    torch \
    transformers \
    pillow \
    keras \
    tensorflow \
    traitlets==5.9.0 \
    notebook==6.4.0

# Установка переменной окружения для conda
ENV PATH /opt/conda/bin:$PATH

# Установка рабочей директории
WORKDIR /workspace

# Открытие порта для Jupyter
EXPOSE 8888

# Команда для запуска Jupyter Notebook
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--no-browser", "--allow-root"]
