// **************************************************************
// Test designs for a peristaltic pump
// Looking to make the repeated curved shape work easier via openscad
// **************************************************************

// --------------------------------------------------------------------------------------------------------------------
// Hardware Settings 
// --------------------------------------------------------------------------------------------------------------------

// This design uses some oddball hardware, but these will be adjustable via the
// following settings:

// -- Drive Shaft

DriveBoltCircumference = 3.8;				// M4-45 Bolt
DriveBoltLength = 45;

DriveNutCircumference = 5;					// M4 Nut
DriveNutHeight = 2.3;

// -- Bolts used for securing two sides of housing together
			
FrameBoltCircumference = 4.1;				// SAE 8-32 Bolt

FrameNutCircumference = 9.7;					// 8-32 nlyoc nut
FrameNutHeight = 6.4;					

// --------------------------------------------------------------------------------------------------------------------
// Design Settings 
// --------------------------------------------------------------------------------------------------------------------

// -- Stator Reference Values for the test

StatorCircumference = 62;               // 
StatorHeight = 30;

StatorFrameCircumference = 45;
StatorFrameHeight = 30;             

StatorClearanceCircumference = 55;

StatorClearanceSpacing = 2;

// -- Frame Reference Values

FaceHeight = 3;

// -- Height of pump housing

HousingHeight = FaceHeight + StatorClearanceSpacing + (StatorFrameHeight/2);


// -- Hose Reference Values

HoseCircumference = 9.5;
HoseCompressedWidth = 3;					// Width of hose when compressed
HoseCompressedHeight = 16;					// Height of hose when compressed

// --------------------------------------------------------------------------------------------------------------------
// Adjustments
// --------------------------------------------------------------------------------------------------------------------

// Settings to compensate for inaccuracies produced from using FFM techniques

EdgeAdjustment = 0.35;				// Adjust to match the printing nozzle

// --------------------------------------------------------------------------------------------------------------------
// Rendering Settings
// --------------------------------------------------------------------------------------------------------------------

ShowHardware=true;
ShowHose=true;

// **************************************************************

// Reference casing
// --------------------------------------------------------------------------------------------------------------------

color([1,1,0])
	translate([6.5,0,9.5])
		import("Casing_Reference.stl", convexity=3);

// Test Ring
// --------------------------------------------------------------------------------------------------------------------

rotate_extrude(convexity = 3)
    translate([StatorCircumference / 2 + HoseCompressedWidth, 0, 0])
        square([4,HousingHeight],center=false);
        
color([1,0,0])
rotate_extrude(convexity = 3)
    translate([StatorClearanceCircumference / 2 + HoseCompressedWidth, 0, 0])
        square([(StatorCircumference - StatorClearanceCircumference)/2, HousingHeight - (StatorFrameHeight/2)],center=false);
        
color([0,0,1])
rotate_extrude(convexity = 3)
    translate([StatorFrameCircumference / 2 + HoseCompressedWidth, 0, 0])
        square([(StatorClearanceCircumference - StatorFrameCircumference) / 2,FaceHeight],center=false); 