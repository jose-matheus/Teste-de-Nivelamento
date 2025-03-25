import requests
import wget
from bs4 import BeautifulSoup

# URL da página com os arquivos PDF
url_pagina = 'https://www.gov.br/ans/pt-br/acesso-a-informacao/participacao-da-sociedade/atualizacao-do-rol-de-procedimentos'

# Fazer uma requisição HTTP para obter o conteúdo da página
resposta = requests.get(url_pagina)
resposta.raise_for_status()  # Levanta um erro se a requisição falhar

# Usar BeautifulSoup para fazer o parsing do conteúdo HTML
soup = BeautifulSoup(resposta.text, 'html.parser')

# Definir os nomes dos arquivos que você quer baixar
arquivos_desejados = ['Anexo I', 'Anexo II']

# Encontrar os links dos arquivos PDF que contenham "Anexo I" ou "Anexo II" e terminem com ".pdf"
pdf_links = []
for link in soup.find_all('a', href=True):
    href = link['href']
    # Verifica se o link é um PDF e se contém "Anexo I" ou "Anexo II"
    if href.lower().endswith('.pdf') and any(nome in link.get_text() for nome in arquivos_desejados):
        pdf_links.append(href)

# Baixar os arquivos PDF encontrados
for pdf_link in pdf_links:
    # Certificar-se de que a URL do PDF está completa (acrescentar domínio se necessário)
    if not pdf_link.startswith('http'):
        pdf_link = 'https://www.gov.br' + pdf_link

    # Baixar o arquivo PDF com wget
    print(f"Baixando {pdf_link}")
    wget.download(pdf_link)

print("Downloads completos!")
