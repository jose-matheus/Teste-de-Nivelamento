import requests
import wget
import os
import glob
import zipfile
from zipfile import ZipFile, ZIP_DEFLATED
from bs4 import BeautifulSoup

url_pagina = 'https://www.gov.br/ans/pt-br/acesso-a-informacao/participacao-da-sociedade/atualizacao-do-rol-de-procedimentos'

resposta = requests.get(url_pagina)
resposta.raise_for_status()  

soup = BeautifulSoup(resposta.text, 'html.parser')

arquivos_desejados = ['Anexo I', 'Anexo II']


pdf_links = []
for link in soup.find_all('a', href=True):
    href = link['href']
   
    if href.lower().endswith('.pdf') and any(nome in link.get_text() for nome in arquivos_desejados):
        pdf_links.append(href)


for pdf_link in pdf_links:

    if not pdf_link.startswith('http'):
        pdf_link = 'https://www.gov.br' + pdf_link

    print(f"Baixando {pdf_link}")
    wget.download(pdf_link)

print("Downloads completos!")

diretorio = './'
arquivos = glob.glob(os.path.join(diretorio, '*.pdf'))

arquivo_zip = 'AnexosComprimidos.zip'

with zipfile.ZipFile(arquivo_zip, 'w') as zipf:
    for arquivo in arquivos:
        if os.path.isfile(arquivo):
            zipf.write(arquivo, arcname=os.path.basename(arquivo))

print(f'Arquivo {arquivo_zip} criado com sucesso com {len(arquivos)} arquivos PDF!')