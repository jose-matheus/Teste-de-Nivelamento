import pdfplumber
import pandas as pd
import zipfile
import os

legenda = {
    "OD": "Seg. Odontológica",
    "AMB": "Seg. Ambulatorial",
    "HCO": "Seg. Hospitalar Com Obstetrícia",
    "HSO": "Seg. Hospitalar Sem Obstetrícia",
    "REF": "Plano Referência",
    "PAC": "Procedimento de Alta Complexidade",
    "DUT": "Diretriz de Utilização"
}

def extrair_tabela_pdf(pdf_path, output_csv, output_zip):
    with pdfplumber.open(pdf_path) as pdf:
        tabelas = []
        for page in pdf.pages:
            tabela = page.extract_table()
            if tabela:
                tabelas.extend(tabela)

    df = pd.DataFrame(tabelas[1:], columns=tabelas[0])  

    df.replace(legenda, inplace=True)

    df.to_csv(output_csv, index=False, encoding="utf-8-sig")
    print(f"Arquivo CSV salvo como: {output_csv}")
    
    with zipfile.ZipFile(output_zip, 'w', zipfile.ZIP_DEFLATED) as zipf:
        zipf.write(output_csv, os.path.basename(output_csv))  # Adiciona o CSV ao ZIP
    print(f"Arquivo ZIP salvo como: {output_zip}")
    
    os.remove(output_csv)
    print(f"Arquivo CSV {output_csv} removido após compressão.")

extrair_tabela_pdf("anexo1.pdf", "saida.csv", "Teste_{jose_matheus}.zip")
