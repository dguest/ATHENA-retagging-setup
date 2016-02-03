# Athena Retagging Setup

Purpose of these scripts:
Setting up Athena with retagging including DL1 in b-tagging-only framework in one go.

How to use it:
In a new lxplus session, go to a direcory of your choice and copy setup_TestArea.sh and create_TestArea.sh from the clone there. Then, to create a Athena test area, run `source create_TestArea.sh` and specify the name of the directory (will be created) in which your test area will be set up. All packages required to run retagging with the DL1 tagger will be downloaded, compiled and the work area will be set up. Retag will be switched on in the job options automatically. The xAOD you can use for a testrun is in a public directory and will be specified automatically by the using the job options (JO) delivered with the clone of this repository.
In the JO (see `$TestArea/xAODAthena/run/jobOptions_Tag.py`) one defines the number of events to run over with the argument given in `jp.AthenaCommonFlags.EvtMax.set_Value_and_Lock(10)`. Setting the argument to `-1` would corresponds to using all events in the xAOD. The JOs currently set the number of events to 10. The job options also allows to switch on using a local NN configuration file and define the NN configuration file that will be used by DL1. 

Once the test area is already set up, `source setup_TestArea.sh` will when starting from a new lxplus session set up Athena in your previously created test area.

In order to run the job, go to `$TestArea/run/` and run `athena jobOptions_Tag.py`.
The ROOT output file where the retagging ouput is stored in branches is stored as `$TestArea/run/flav_Akt4EMTo.root`.

In case of problems:
For feedback, contact me at `marie.christine.lanfermann@cern.ch`.
