type
  User = object
    username: string
    public_key: string

proc newUser(username, public_key: string): User =
  result.username = username
  result.public_key = public_key

# Example usage:
let alice = newUser("Alice", "AlicePublicKey")
echo alice.username  # Output: Alice
echo alice.public_key  # Output: AlicePublicKey
