# Utiliser une image de base officielle de Python
FROM python:3.12.4-slim

# Définir le répertoire de travail dans le conteneur
WORKDIR /workspace

# Créer un utilisateur pour le dev container
RUN groupadd --gid 1000 vscode \
    && useradd --uid 1000 --gid vscode --shell /bin/bash --create-home vscode

# Copier les fichiers de dépendances et installer les dépendances
COPY ./requirements.txt ./requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copier le code de l'application
COPY ./src ./src
USER vscode

# Exposer le port 8000 (par exemple, pour une application web)
EXPOSE 8000

# Commande par défaut
CMD ["python", "src/main.py"]
