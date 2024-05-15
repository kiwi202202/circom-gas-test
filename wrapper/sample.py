import hashlib

input_data = b'\x01\x02\x03'

sha256_hash = hashlib.sha256(input_data).hexdigest()

hash_int = int(sha256_hash, 16)

r = 21888242871839275222246405745257275088548364400416034343698204186575808495617

reduced_value = hash_int % r

print(f"SHA-256 Hash (Hex): {sha256_hash}")
print(f"Hash Integer: {hash_int}")
print(f"Reduced Value: {reduced_value}")
