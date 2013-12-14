# coding=utf-8
import sys, os, subprocess
cmd = ''.join(sys.argv);
#cmd = 'dir c:'

print 'Run Command: [%s]\n' % cmd

popen_obj = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE, bufsize=0)
(stdout, stderr) = popen_obj.communicate()
returncode = popen_obj.returncode

if(returncode <> 0):
    print "Return Code: %s\n" % str(returncode)
if(len(stdout.strip()) > 0):
    print "Standard Out:\n%s" % str(stdout).decode('gbk').replace('\r', '')
if(len(stderr.strip()) > 0):
    print "StandardError Out:\n%s" % str(stderr).decode('gbk').replace('\r', '')


#按行输出程序执行结果
#while True:
    #next_line = popen_obj.stdout.readline()
    #if next_line == '' and popen_obj.pol() != None
        #break
    #print next_line

#print "标准输出:\n"
#for line in popen_obj.stdout:
    #print line.strip()

#print "错误输出:\n"
#for line in popen_obj.stderr:
    #print line.strip()
