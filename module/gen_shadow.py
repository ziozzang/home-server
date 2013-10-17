#!/usr/bin/python

import crypt
import string
from random import sample, choice

def gen_salt(length=16):
  return ''.join(sample((string.letters + string.digits + "./")*(length/4), length))

def get_shadow(password,types="6",salt=None):
  """
  types = "1" : MD5
     1   | MD5
     2a  | Blowfish (not in mainline glibc; added in some
         | Linux distributions)
     5   | SHA-256 (since glibc 2.7)
     6   | SHA-512 (since glibc 2.7)
  """
  if salt is None:
    salt = gen_salt()
  return crypt.crypt(password, "$%s$%s$" % (types,salt))


if __name__=="__main__":
  get_shadow(sys.argv[1])

