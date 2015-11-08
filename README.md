# Athena-retagging-setup
Setting up Athena with retagging includeing DL1 in b-tagging-only framework in one go.

How to use it:
In a new lxplus session, go to a direcory of your choice and copy setup_TestArea.sh and create_TestArea.sh there. Then, to create an Athena test area, run `source create_TestArea.sh` and specify the name of the directory (will be created) in which your test area will be set up. All packages required to run retagging with the DL1 tagger will be downloaded, compiled and the work area will be set up. Retag will be switched on in the job options automatically. However, the xAOD you choose to run over still needs to be defined.

Once the test area is already set up, `source setup_TestArea.sh` will speed things up by setting up Athena in your test area.

In case of problems:
For feedback, contact me at `marie.christine.lanfermann@cern.ch`.
