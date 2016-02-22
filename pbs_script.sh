# This is just a sample PBS script. You should adapt the
# following example script, so that you can run all your experiments.
# For more information about Torque and PBS, check the following sources:
#    https://support.cc.gatech.edu/facilities/instructional-labs/how-to-run-jobs-on-the-instructional-hpc-clusters
#    http://www.democritos.it/activities/IT-MC/documentation/newinterface/pages/runningcodes.html


# allocate 4 of the (24 total) sixcore nodes for up to 5 minutes

#PBS -q class
#PBS -l nodes=8:sixcore
#PBS -l walltime=01:00:00
#PBS -N cse6220-nqueens

# TODO: change this to your project directory relative to your home directory
#       (= $HOME)
cd $HOME/prog1/cx4220_hw1

# hardcode MPI path
MPIRUN=/usr/lib64/openmpi/bin/mpirun

# set the n-queens master-depth k

# set size of the problem instance

# loop over number of processors (our 4 nodes job can run up to 48)
# for p in 6 12 24 30 48
# do
#         for N in 8 10 13 20 30 40
#         do
#             $MPIRUN -np $p --hostfile $PBS_NODEFILE ./nqueens -t $N 5
#         done
# done
# p=16
# N=13
# $MPIRUN -np $p --hostfile $PBS_NODEFILE ./nqueens -t $N 4

for K in 1 4 7 10 13 16
do
    $MPIRUN -np 14 --hostfile $PBS_NODEFILE ./nqueens -t 16 $K
done
        
# for p in 12 24 30
# do
#     for N in 13 20
#     do
#         for K in 1 2 3 5 9 10
#         do
#             $MPIRUN -np $p --hostfile $PBS_NODEFILE ./nqueens -t $N $K
#         done
#     done
# done
