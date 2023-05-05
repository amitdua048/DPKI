echo "key validation"
proc isValidKey(public_key: string): bool =
  # Replace this with your public key validation logic.
  # For example, you can check the key length, format, or other properties.
  if public_key.len > 0:
    return true
  else:
    return false

# Example usage:
let valid_key = "ValidPublicKey"
let invalid_key = ""

echo isValidKey(valid_key)  # Output: true
echo isValidKey(invalid_key)  # Output: false

