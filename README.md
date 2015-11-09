# Athena-retagging-setup
Setting up Athena with retagging includeing DL1 in b-tagging-only framework in one go.

How to use it:
In a new lxplus session, go to a direcory of your choice and copy setup_TestArea.sh and create_TestArea.sh there. Then, to create an Athena test area, run `source create_TestArea.sh` and specify the name of the directory (will be created) in which your test area will be set up. All packages required to run retagging with the DL1 tagger will be downloaded, compiled and the work area will be set up. Retag will be switched on in the job options automatically. The xAOD you can use for a testrun is in a public directory and will be specified automatically by the patch.
In the job options (see `$TestArea/xAODAthena/run/jobOptions_Tag.py`) one defines the number of events to run over with the argument given in `jp.AthenaCommonFlags.EvtMax.set_Value_and_Lock(-1)`. `-1` corresponds to using all events in the xAOD.

Once the test area is already set up, `source setup_TestArea.sh` will when starting from a new lxplus session set up Athena in your previously created test area.

In case of problems:
For feedback, contact me at `marie.christine.lanfermann@cern.ch`.
