#define PREVIEW_PREF_JOB "Job"
#define PREVIEW_PREF_LOADOUT "Loadout"
#define PREVIEW_PREF_UNDERWEAR "Underwear"
#define PREVIEW_PREF_NAKED "Naked"

#define READ_PREFS(target, pref) (target.client?.prefs?.read_preference(/datum/preference/pref))

// tgui category
#define PREFERENCE_CATEGORY_MARKINGS "markings"
