# Kerberos AS-REP Roasting

This kind of attack works for users with pre-authentication disabled, user is set to "Do not require Kerberos authentication"

## Steps to perform the attack:
1. Identify a user with pre-authentication option disabled
2. Request authentication ticket (TGT) from the domain controller/KDC
3. The domain controller responds baack with encrypted user's account details
4. Store TGT offline and crack it to extrack user account password.

## Utils tools and info
Such attack can be performed using https://github.com/GhostPack/Rubeus#weaponization