# Athena Retagging Setup

#### Purpose of these scripts:
Setting up Athena with retagging including DL1 in b-tagging-only framework in one go.

#### How to use it:

1. Start from a new lxplus session.
2. Go to a direcory of your choice and copy setup_TestArea.sh and create_TestArea.sh from the clone into that directory.
3. To create a Athena test area, run

`source create_TestArea.sh`

and specify the name of the directory in which your test area will be set up when asked for it.

###### What this will do:
This will get all the packages required to run retagging with the DL1 tagger using the flavourtagging performance framework, they will automatically be compiled and the work area will be set up.

###### Details on the provided job options (JO):
Retagging will be [switched on](https://github.com/Marie89/ATHENA-retagging-setup/blob/master/jobOptions_Tag.py#L114) and an xAOD which can be used for a test run is [defined in a public directory](https://github.com/Marie89/ATHENA-retagging-setup/blob/master/jobOptions_Tag.py#L27) as well.
The JO also define the number of events to run over with the argument given in

```
jp.AthenaCommonFlags.EvtMax.set_Value_and_Lock(10)
```

Setting the argument to `-1` would corresponds to using all events in the xAOD. The JOs currently set the number of events to 10.
With the current Athena settings it is also possible to switch to using a local NN configuration file (in JSON format with special syntax!) that will be used by DL1 by [defining it](https://github.com/Marie89/ATHENA-retagging-setup/blob/master/jobOptions_Tag.py#L115).


4. **Once the test area is already set up**,

`source setup_TestArea.sh`

will, when starting another time from a new lxplus session, set up Athena in your previously created test area.

That's it.


###### About actually using it in a test run:

In order to run the job, go to `$TestArea/run/` and run `athena jobOptions_Tag.py`.
The ROOT output file where the retagging ouput is stored in branches is stored as `$TestArea/run/flav_Akt4EMTo.root`.


###### In case of problems:
For feedback, contact me at `marie.christine.lanfermann@cern.ch`.
