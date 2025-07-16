select
  *
from
  Patients
where
  conditions regexp '(^| )DIAB1[0-9][0-9]($| )';