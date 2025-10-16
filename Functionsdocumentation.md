
Contract Name: IPRegistry
Purpose

A decentralized registry for intellectual property (IP) assets that allows users to:

Register their IPs on-chain.

Transfer ownership of IPs.

Revoke IPs (admin-only).

View IP details and status.



Core Features
Function	Description
registerIP(title, ipHash)	Registers a new IP asset, generating a unique ID and storing metadata.
transferOwnership(ipId, newOwner)	Allows the current owner to transfer IP ownership.
revokeIP(ipId)	Admin-only function to deactivate an IP.
getIPDetails(ipId)	Returns IP metadata (title, hash, owner, date, active status).
isIPActive(ipId)	Checks if an IP is acti

🔐 Access Control

Admin: The contract deployer; can revoke IPs.

Owner: The user who registered the IP; can transfer ownership.

📊 State Variables

ipAssets: Stores all IP records by their ID.

userRegistrations: Tracks how many IPs each address has registered.

totalRegistered: Counts total registered IPs.

admin: Stores the admin address.

🚨 Events

IPRegistered — emitted on registration.

IPTransferred — emitted when ownership changes.

IPRevoked — emitted when an IP is revoked.

✅ Strengths

Clear access control and ownership rules.

Transparent and auditable registry.

Efficient and straightforward implementation.