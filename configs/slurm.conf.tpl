{{- $slurmVersion := getenv "SLURM_VERSION" }}
# slurm.conf
#
# See the slurm.conf man page for more information.
#
ClusterName=linux
ControlMachine=slurmctld
ControlAddr=slurmctld
#BackupController=
#BackupAddr=
#
SlurmUser=slurm
#SlurmdUser=root
SlurmctldPort=6817
SlurmdPort=6818
AuthType=auth/munge
#JobCredentialPrivateKey=
#JobCredentialPublicCertificate=
StateSaveLocation=/var/lib/slurmd
SlurmdSpoolDir=/var/spool/slurmd
SwitchType=switch/none
MpiDefault=none
SlurmctldPidFile=/var/run/slurmd/slurmctld.pid
SlurmdPidFile=/var/run/slurmd/slurmd.pid
ProctrackType=proctrack/linuxproc
#PluginDir=
#CacheGroups=0
#FirstJobId=
ReturnToService=0
#MaxJobCount=
#PlugStackConfig=
#PropagatePrioProcess=
#PropagateResourceLimits=
#PropagateResourceLimitsExcept=
#Prolog=
#Epilog=
#SrunProlog=
#SrunEpilog=
#TaskProlog=
#TaskEpilog=
#TaskPlugin=
#TrackWCKey=no
#TreeWidth=50
#TmpFS=
#UsePAM=
#
# TIMERS
SlurmctldTimeout=300
SlurmdTimeout=300
InactiveLimit=0
MinJobAge=300
KillWait=30
Waittime=0
#
# SCHEDULING
SchedulerType=sched/backfill
#SchedulerAuth=
#SchedulerPort=
#SchedulerRootFilter=
{{- if lt $slurmVersion "23.02" }}
SelectType=select/cons_res
{{- else }}
SelectType=select/cons_tres
{{- end }}
SelectTypeParameters=CR_CPU_Memory
{{- if lt $slurmVersion "23.11" }}
FastSchedule=1
{{- end }}
#PriorityType=priority/multifactor
#PriorityDecayHalfLife=14-0
#PriorityUsageResetPeriod=14-0
#PriorityWeightFairshare=100000
#PriorityWeightAge=1000
#PriorityWeightPartition=10000
#PriorityWeightJobSize=1000
#PriorityMaxAge=1-0
#
# LOGGING
SlurmctldDebug=3
SlurmctldLogFile=/var/log/slurm/slurmctld.log
SlurmdDebug=3
SlurmdLogFile=/var/log/slurm/slurmd.log
JobCompType=jobcomp/filetxt
JobCompLoc=/var/log/slurm/jobcomp.log
#
# ACCOUNTING
JobAcctGatherType=jobacct_gather/linux
JobAcctGatherFrequency=30
#
AccountingStorageType=accounting_storage/slurmdbd
AccountingStorageHost=slurmdbd
AccountingStoragePort=6819
#AccountingStorageLoc=slurm_acct_db
#AccountingStoragePass=
#AccountingStorageUser=
#
# COMPUTE NODES
NodeName=c[1-2] CPUs=1 RealMemory=1000 State=UNKNOWN
#
# PARTITIONS
PartitionName=normal Default=yes Nodes=c[1-2] Priority=50 DefMemPerCPU=500 Shared=NO MaxNodes=2 MaxTime=5-00:00:00 DefaultTime=5-00:00:00 State=UP
