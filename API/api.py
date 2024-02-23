from flask import Flask, jsonify

app = Flask(__name__)

# Dados de exemplo
itens = [
    {"id": 1, "nome": "Item 1"},
    {"id": 2, "nome": "Item 2"},
    {"id": 3, "nome": "Item 3"},
]

# Rota para listar todos os itens
@app.route('/itens', methods=['GET'])
def get_itens():
    return jsonify({'itens': itens})

if __name__ == '__main__':
    app.run(debug=True)