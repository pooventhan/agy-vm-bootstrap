# Git SSH Setup

This guide configures Git SSH access on a fresh Linux VM and verifies access to Bitbucket.

## 1. Generate an SSH key

Generate an Ed25519 key:

```bash
ssh-keygen -t ed25519 -C "pooven-work"
```

Press **Enter** to use the default location:

```text
~/.ssh/id_ed25519
```

This creates:

```text
~/.ssh/id_ed25519
~/.ssh/id_ed25519.pub
```

Keep the private key (`id_ed25519`) secret.

## 2. Add the public key to Bitbucket

Display the public key:

```bash
cat ~/.ssh/id_ed25519.pub
```

Copy the entire output and add it to:

**Bitbucket → Personal settings → SSH keys → Add key**

## 3. Test Bitbucket SSH access

Run:

```bash
ssh -T git@bitbucket.org
```

On the first connection, SSH will ask whether to trust Bitbucket.

A successful authentication looks similar to:

```text
authenticated via ssh key.

You can use git to connect to Bitbucket. Shell access is disabled
```

This confirms that SSH authentication is working.
