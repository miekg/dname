%%%
title = "Moving the DNAME Resource Record to Historic Status"
abbrev = "Obsolete DNAME"
ipr = "trust200902"
area = "Internet"
workgroup = "DNS Operations"
submissiontype = "IETF"
keyword = ["DNS", "DNAME", "obsolete"]
updates = [6672]

[seriesInfo]
name = "I-D"
value = "draft-gieben-obsolete-dname-00"
stream = "IETF"
status = "standard"

[[author]]
initials="R."
surname="Gieben"
fullname="R. (Miek) Gieben"
  [author.address]
  email = "miek@miek.nl"
%%%

.# Abstract

This document retires the DNAME Resource Record and reclassifies RFC 6672 as Historic. [@-RFC6672]

{mainmatter}

# Introduction

# Requirements Language

The key words "**MUST**", "**MUST NOT**", "**REQUIRED**", "**SHALL**", "**SHALL NOT**",
"**SHOULD**", "**SHOULD NOT**", "**RECOMMENDED**" "**NOT RECOMMENDED**", "**MAY**", and
"**OPTIONAL**" in this document are to be interpreted as described in RFC 2119 [@!RFC2119].

# Issues with DNAME

List of issues and why DNAME is hard, reference DNSSEC, wild card, some other RFCs.

# Header that makes sense

There are several ways DNS software may encounter a DNAME record, they are:

1. parsing the record in a [@RFC1035] zone file.
2. parsing the wire format as described in [@!RFC2672] Section 3.

When parsing a zone file and encountering a DNAME record, any confirming software **MUST** error on
encountering the RR and refuse to load the zone. If zone is DNSSEC signed, any RRSIG resource records
covering a DNAME record **MUST** also lead to a refusal to load the zone. (TODO: we may not care
about RRSIGs here).

Parsing a DNAME record from the wire format it **MUST** be parsed as an unknown record as specified
in [@!RFC3597].

# Special Processing

All special processing as described in [@!RFC6672] is hereby obsoleted.

If some DNS software parsing the record from the wire has a DNAME Resource Record in memory and
responds to queries, direct queries for `TYPE39` will return the record. This is in line with the
[@!RFC3597] specification.

{backmatter}
