# Use a imagem oficial do Python como base.  A versão slim é menor e mais eficiente.
# Versão slim: FROM python: 3.13-slim-buster
FROM python:3.13.5-alpine3.22
# Define o diretório de trabalho dentro do container.
WORKDIR /app

# Copia o arquivo de requirements para o diretório de trabalho.
COPY requirements.txt .
# Instala as dependências Python listadas no requirements.txt.
# O argumento --no-cache-dir evita o armazenamento de cache do pip, reduzindo o tamanho da imagem.
RUN pip install --no-cache-dir -r requirements.txt

# Copia o restante do código da aplicação para o diretório de trabalho.
COPY . .

# Expões a porta que a aplicação FastAPI irá rodar
EXPOSE 8000

# Define o comando a ser executado quando o container for iniciado.
# Uvicorn é um servidor ASGI para aplicações Python.
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
