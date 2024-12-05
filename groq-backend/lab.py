def rail_fence_encrypt(text, key):
    """Encrypt text using Rail Fence cipher."""
    rails = [''] * key
    rail_direction = 1
    rail = 0

    for char in text:
        rails[rail] += char
        rail += rail_direction
        if rail == 0 or rail == key - 1:
            rail_direction *= -1

    return ''.join(rails)


def columnar_transposition_encrypt(text, key):
    """Encrypt text using Columnar Transposition cipher."""
    key_order = sorted(range(len(key)), key=lambda k: key[k])
    num_columns = len(key)
    num_rows = -(-len(text) // num_columns)  # Ceiling division
    padded_text = text.ljust(num_columns * num_rows, 'X')  # Padding with 'X'

    matrix = [padded_text[i:i + num_columns] for i in range(0, len(padded_text), num_columns)]

    cipher = ''.join(''.join(row[col] for row in matrix) for col in key_order)
    return cipher


def combined_encrypt(text, key):
    rail_fence_cipher = rail_fence_encrypt(text, int(key))
    columnar_cipher = columnar_transposition_encrypt(rail_fence_cipher, key)
    return columnar_cipher


text = "HELLOWORLD"
key = "2" 
cipher_text = combined_encrypt(text, key)
print(f"Encrypted Text: {cipher_text}")
