<p align="center">
  <img src="img/mykuber.png" alt="Docker Logo" />
</p>

# About Kubernetes Pods

Kubernetes Pods created with the help of <a href="https://claude.ai/">Claude</a> and <a href="https://chat.deepseek.com/">DeekSeek</a> AI.

## Users and passwords

### <em>You will find the credentials and the information you need in .yml files.</em>

## For your information
<em>Some pods take a while to start, so be patient.</em><br>
<em>Feel free to contact me if you see any issue.</em>

## - Pods

### Commands

```bash
# Create pod
kubectl apply -f <file-name>.yml

# Delete pod
kubectl delete -f <file-name>.yml

# Pod details
kubectl get pv,pvc,deploy,pod,service

# Pod log
kubectl logs <pod-name> -c <pod-app-name> -f
- E.g.: kubectl logs postgres-0 -c postgres -f

# Monitor Pod Status
kubectl get pods -w
```

## - Apache NiFi

```bash
# URLs

http://localhost:8080/nifi/
http://localhost:30080/nifi/
```

## - Cassandra

```bash
# Connect
kubectl exec -it cassandra-0 -- cqlsh -u cassandra -p cassandra

# Create keyspace
CREATE KEYSPACE mykeyspace WITH replication = {'class':'SimpleStrategy', 'replication_factor':1};

# Use your Keyspace
USE mykeyspace;

# Create table
CREATE TABLE users (user_id uuid PRIMARY KEY, name text, email text);

# Insert users

-- Insert single row
INSERT INTO users (user_id, name, email) 
VALUES (uuid(), 'John Doe', 'john@example.com');

-- Insert multiple rows
INSERT INTO users (user_id, name, email) 
VALUES (uuid(), 'Jane Smith', 'jane@example.com');

INSERT INTO users (user_id, name, email) 
VALUES (uuid(), 'Bob Johnson', 'bob@example.com');
```

## - CouchDB

```bash
# URLs
http://localhost:30984/_utils/#login
http://localhost:30984

# Veryfing the cluster
kubectl exec -it couchdb-<pod-id> -- curl -X GET http://couchdb:couchdb@localhost:5984/_membership
```

## - InfluxDB

```bash
# Web UI
http://localhost:30086

# API Endpoint
http://localhost:30086/api/v2
```

## - Jenkins

```bash
# URL
http://localhost:30080/
```

## - Kafka

```bash
# Kafka Broker: Internal DNS
kafka.kafka.svc.cluster.local:9092

# Kafka-UI Dashboard
http://localhost:31080
```

## - Keycloak

```bash
# pgAdmin URL & Register Server
http://localhost:30000/

# Hostname/Address - Use ClusterIP
kubectl get service

# Maintenance Database
keycloak

# Credentials
Username: keycloak
Password: postgrespassword
```

```bash
# Keycloak URL
http://localhost:30080/
```

## - Mantis Bug Tracker

```bash
# URLs
http://localhost:30080/
http://localhost/
```

## - MongoDB

```bash
# Mongosh or MongoDB Compass - Access
mongodb://mongodb:mongodb@localhost:27017
```

## - MySQL

```bash
# Driver properties - DBeaver e.g.
allowPublicKeyRetrievel: TRUE

# Server
localhost

# External port
3306
```

## - OpenLDAP

```bash
# Test LDAP connection
kubectl exec openldap-pod -- ldapsearch -x -H ldapi:/// -b "dc=example,dc=org" -D "cn=admin,dc=example,dc=org" -w admin123

# Test Admin Authentication
kubectl exec openldap-pod -c openldap -- ldapwhoami -x -H ldapi:/// -D "cn=admin,dc=example,dc=org" -w admin123

# Search Base DN
kubectl exec openldap-pod -c openldap -- ldapsearch -x -H ldapi:/// -b "dc=example,dc=org" -D "cn=admin,dc=example,dc=org" -w admin123

# Test TLS (if configured)
kubectl exec openldap-pod -c openldap -- ldapsearch -ZZ -H ldap://localhost -b "dc=example,dc=org" -D "cn=admin,dc=example,dc=org" -w admin123

# Create Missing Organizational Units
kubectl exec openldap-pod -c openldap -- bash -c 'cat <<EOF | ldapadd -x -H ldapi:/// -D "cn=admin,dc=example,dc=org" -w admin123
dn: ou=users,dc=example,dc=org
objectClass: organizationalUnit
ou: users

dn: ou=groups,dc=example,dc=org
objectClass: organizationalUnit
ou: groups
EOF'

# Add the Test User Correctly
kubectl exec openldap-pod -c openldap -- bash -c 'cat <<EOF | ldapadd -x -H ldapi:/// -D "cn=admin,dc=example,dc=org" -w admin123
dn: uid=testuser,ou=users,dc=example,dc=org
objectClass: inetOrgPerson
objectClass: posixAccount
objectClass: shadowAccount
uid: testuser
cn: Test User
sn: User
uidNumber: 10000
gidNumber: 10000
homeDirectory: /home/testuser
userPassword: {CRYPT}x
EOF'

# Set the Password Properly
kubectl exec openldap-pod -c openldap -- ldappasswd -H ldapi:/// -s "testpass" -D "cn=admin,dc=example,dc=org" -w admin123 "uid=testuser,ou=users,dc=example,dc=org"

# Verify the User Was Added
kubectl exec openldap-pod -c openldap -- ldapsearch -x -H ldapi:/// -b "uid=testuser,ou=users,dc=example,dc=org" -D "cn=admin,dc=example,dc=org" -w admin123

# Complete Working Example - If you want to start fresh, here's a complete LDIF file you can apply:
kubectl exec openldap-pod -c openldap -- bash -c 'cat <<EOF | ldapadd -x -H ldapi:/// -D "cn=admin,dc=example,dc=org" -w admin123
dn: dc=example,dc=org
objectClass: top
objectClass: domain
dc: example

dn: ou=users,dc=example,dc=org
objectClass: organizationalUnit
ou: users

dn: ou=groups,dc=example,dc=org
objectClass: organizationalUnit
ou: groups

dn: uid=testuser,ou=users,dc=example,dc=org
objectClass: inetOrgPerson
objectClass: posixAccount
objectClass: shadowAccount
uid: testuser
cn: Test User
sn: User
uidNumber: 10000
gidNumber: 10000
homeDirectory: /home/testuser
userPassword: {CRYPT}x
EOF'

# Then set the password
kubectl exec openldap-pod -c openldap -- ldappasswd -H ldapi:/// -s "testpass" -D "cn=admin,dc=example,dc=org" -w admin123 "uid=testuser,ou=users,dc=example,dc=org"

# Add More Sample Users (copy-paste ready):
kubectl exec openldap-pod -c openldap -- bash -c 'cat <<EOF | ldapadd -x -H ldapi:/// -D "cn=admin,dc=example,dc=org" -w admin123
dn: uid=jsmith,ou=users,dc=example,dc=org
objectClass: inetOrgPerson
objectClass: posixAccount
uid: jsmith
cn: John Smith
sn: Smith
userPassword: {CRYPT}x
uidNumber: 10001
gidNumber: 10000
homeDirectory: /home/jsmith

dn: cn=developers,ou=groups,dc=example,dc=org
objectClass: groupOfNames
cn: developers
member: uid=testuser,ou=users,dc=example,dc=org
member: uid=jsmith,ou=users,dc=example,dc=org
EOF'

# Set Passwords
kubectl exec openldap-pod -c openldap -- ldappasswd -H ldapi:/// -s "smithpass" -D "cn=admin,dc=example,dc=org" -w admin123 "uid=jsmith,ou=users,dc=example,dc=org"

# Verify Group Membership
kubectl exec openldap-pod -c openldap -- ldapsearch -x -H ldapi:/// -b "cn=developers,ou=groups,dc=example,dc=org" -D "cn=admin,dc=example,dc=org" -w admin123

# Backup Your Data
kubectl exec openldap-pod -c openldap -- slapcat -n 1 > ldap_backup.ldif
```

## - Oracle DB

```bash
# URL
https://localhost:31500/em

# Database and SID name
XE

# External port
31521
```

## - PostgreSQL

```bash
# pgAdmin
http://localhost:30000/

# Hostname/address
postgres
```

## - Prometheus & Grafana

```bash
# Prometheus
http://localhost:30909/

# Grafana
http://localhost:30300/
```

## - RabbitMQ

```bash
# RabbitMQ Management
http://localhost:31672/
```

## - Redis

```bash
# Checkout
kubectl exec -n redis -it deploy/redis -- redis-cli ping
```

## - Redmine

```bash
# URL
http://localhost:30300/

# Default credentials
Username: admin
Password: admin
```

## - Zipkin

```bash
# URLs
http://localhost:30411/
http://localhost:9411/
```

