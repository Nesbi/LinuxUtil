import psutil 
import subprocess
import texttable as tt

column_left = []
column_right = []

# Users
column_left.append("Users:")
column_left.append("="*60)
users = sorted(set(user for user,_,_,_,_ in psutil.users()))

for user in users:
    column_left.append(user)

column_left.append("-"*60)

# CPU
column_left.append("CPU")
column_left.append("="*60)
bar_length = 40
columns = 3

cpu = enumerate(psutil.cpu_percent(interval=0.1,percpu=True))

cores_status = []
for core,percent in cpu:
    usage = percent/100.0    
    fill = "|"*int(bar_length*usage)
    column_left.append("{:>3}: [{:<{bar_length}}{:>5}%]".format(core+1,fill,percent,bar_length=bar_length))

column_right = []
column_right.append("Squeue")
column_right.append("="*70)
column_right += [line.lstrip().rstrip() for line in subprocess.check_output(["squeue"]).decode("utf-8").split("\n")]

# Fix length
len_left = len(column_left)
len_right = len(column_right)

if len_left < len_right:
    column_left += [""]*(len_right-len_left)
elif len_right < len_left:
    column_right += [""]*(len_left-len_right)

tabular = tt.Texttable()
tabular.set_deco(tt.Texttable.VLINES)
tabular.set_max_width(0)
for row in zip(column_left,column_right):
    tabular.add_row(row)

print(tabular.draw())


