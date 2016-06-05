#!/bin/sh

> database.sql
cat design.sql >> database.sql
cat functions.sql >> database.sql
cat procedures.sql >> database.sql
cat triggers.sql >> database.sql
cat events.sql >> database.sql