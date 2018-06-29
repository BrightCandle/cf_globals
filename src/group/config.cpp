#include "script_component.hpp"

class CfgPatches
{
	class cf_globals
		{
			units[] = { };
			weapons[] = { };
			requiredAddons[] = {"CBA_MAIN"};
			requiredVersion=1.82;
			version = "1.0";
			versionStr = "1.0";
			versionDesc="CF_GLOBALS";
			versionAr[] = {1,3};
			author = "BrightCandle";
			authors[]= {"BrightCandle"};
			url = "https://www.charliefoxtrotops.eu";
		};
};

class CfgSettings {
   class CBA {
      class Versioning {
         class cf_bai {
           	main_addon = "cf_globals";

            class Dependencies {
               CBA[]={"cba_main", {3,6,0}, "true"};
            };
         };
      };
   };
};

#include "CfgFunctions.hpp"