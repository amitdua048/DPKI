import tables

type
  User = object
    username: string
    public_key: string

  DPKI = object
    users: Table[string, User]

proc newUser(username, public_key: string): User =
  result.username = username
  result.public_key = public_key

proc newDPKI(): DPKI =
  result.users = initTable[string, User]()

proc isValidKey(public_key: string): bool =
  return public_key.len > 0

proc isDuplicateKey(d: DPKI, public_key: string): bool =
  for user in d.users.values:
    if user.public_key == public_key:
      return true
  return false

proc addNewUser(d: var DPKI, username, public_key: string) =
  if not isValidKey(public_key):
    echo "Invalid public key."
    return

  if isDuplicateKey(d, public_key):
    echo "Duplicate public key."
    return

  if username in d.users:
    echo "Username already exists."
    return

  let user = newUser(username, public_key)
  d.users[username] = user
  echo "User added successfully."

# Example usage:
var dpki = newDPKI()
dpki.addNewUser("Alice", "AlicePublicKey")
dpki.addNewUser("Bob", "BobPublicKey")
dpki.addNewUser("Alice", "AlicePublicKey2")  # Output: Username already exists.
dpki.addNewUser("Eve", "BobPublicKey")  # Output: Duplicate public key.
