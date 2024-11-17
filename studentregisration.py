from flask import Flask, request, jsonify

app = Flask(__name__)

# In-memory database (a list of dictionaries)
users = []

@app.route('/register', methods=['POST'])
def register_user():
    # Get data from the request body
    data = request.get_json()

    # Extract email and password
    email = data.get('email')
    password = data.get('password')

    # Basic validation
    if not email or not password:
        return jsonify({"message": "Email and password are required"}), 400

    # Check if the email is already in use
    if any(user['email'] == email for user in users):
        return jsonify({"message": "Email already in use"}), 400

    # Add the new user to the in-memory "database"
    users.append({"email": email, "password": password})

    # Respond with a success message
    return jsonify({"message": "User registered successfully"}), 201

if __name__ == '__main__':
    app.run(debug=True)

