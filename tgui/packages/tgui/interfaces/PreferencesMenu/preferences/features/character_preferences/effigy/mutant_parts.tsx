import {
  CheckboxInput,
  Feature,
  FeatureChoiced,
  FeatureToggle,
  FeatureTriColorInput,
} from '../../base';
import { FeatureDropdownInput } from '../../dropdowns';

export const snout_toggle: FeatureToggle = {
  name: '+ Snout',
  category: 'GAMEPLAY',
  description: `
    When toggled, adds a snout to your character.
  `,
  component: CheckboxInput,
};

export const snout_color: Feature<string[]> = {
  name: 'Snout Color',
  component: FeatureTriColorInput,
};

export const horns_toggle: FeatureToggle = {
  name: '+ Horns',
  category: 'GAMEPLAY',
  description: `
    When toggled, adds horns to your character.
  `,
  component: CheckboxInput,
};

export const horns_color: Feature<string[]> = {
  name: 'Horns Color',
  component: FeatureTriColorInput,
};

export const frills_toggle: FeatureToggle = {
  name: '+ Frills',
  category: 'GAMEPLAY',
  description: `
    When toggled, adds frills to your character.
  `,
  component: CheckboxInput,
};

export const frills_color: Feature<string[]> = {
  name: 'Frills Color',
  component: FeatureTriColorInput,
};

export const tail_type: FeatureChoiced = {
  name: '+ Tail',
  category: 'GAMEPLAY',
  description: `
    Choose which tail to add to your character, if any.
  `,
  component: FeatureDropdownInput,
};

export const ear_type: FeatureChoiced = {
  name: '+ Ears',
  category: 'GAMEPLAY',
  description: `
    Choose which animal ears to add to your character, if any.
  `,
  component: FeatureDropdownInput,
};

export const tail_color: Feature<string[]> = {
  name: 'Tail Color',
  component: FeatureTriColorInput,
};

export const ears_toggle: FeatureToggle = {
  name: '+ Snout',
  category: 'GAMEPLAY',
  description: `
    When toggled, adds fancy ears to your character.
  `,
  component: CheckboxInput,
};

export const ears_color: Feature<string[]> = {
  name: 'Ears Color',
  component: FeatureTriColorInput,
};

export const spines_toggle: FeatureToggle = {
  name: '+ Spines',
  category: 'GAMEPLAY',
  description: `
    When toggled, adds spines to your character.
  `,
  component: CheckboxInput,
};

export const spines_color: Feature<string[]> = {
  name: 'Spines Color',
  component: FeatureTriColorInput,
};

export const caps_toggle: FeatureToggle = {
  name: '+ Mushperson Cap',
  category: 'GAMEPLAY',
  description: `
    When toggled, adds mushperson caps to your character.
  `,
  component: CheckboxInput,
};

export const caps_color: Feature<string[]> = {
  name: 'Caps Color',
  component: FeatureTriColorInput,
};

export const body_markings_toggle: FeatureToggle = {
  name: '+ Markings',
  category: 'GAMEPLAY',
  description: `
    When toggled, adds bodymarkings to your character.
  `,
  component: CheckboxInput,
};

export const body_markings_color: Feature<string[]> = {
  name: 'Body Markings Color',
  component: FeatureTriColorInput,
};

export const moth_markings_toggle: FeatureToggle = {
  name: '+ Moth Markings',
  category: 'GAMEPLAY',
  description: `
    When toggled, adds moth-style bodymarkings to your character.
  `,
  component: CheckboxInput,
};

export const moth_markings_color: Feature<string[]> = {
  name: 'Moth Markings Color',
  component: FeatureTriColorInput,
};

export const wing_type: FeatureChoiced = {
  name: '+ Wings',
  category: 'GAMEPLAY',
  description: `
    When toggled, adds wings to your character.
  `,
  component: FeatureDropdownInput,
};

export const wings_color: Feature<string[]> = {
  name: 'Wings Color',
  component: FeatureTriColorInput,
};

export const has_moth_wings: FeatureToggle = {
  name: '+ Moth Wings',
  category: 'GAMEPLAY',
  description: `
    When toggled, adds matrix-colored moth wings to your character.
  `,
  component: CheckboxInput,
};

export const antennae_toggle: FeatureToggle = {
  name: '+ Moth Antennae',
  category: 'GAMEPLAY',
  description: `
    When toggled, adds moff antennae to your character.
  `,
  component: CheckboxInput,
};

export const antennae_color: Feature<string[]> = {
  name: 'Antennae Color',
  component: FeatureTriColorInput,
};

export const fluff_toggle: FeatureToggle = {
  name: '+ Fluff',
  category: 'GAMEPLAY',
  description: `
    When toggled, adds fluff to your character.
  `,
  component: CheckboxInput,
};

export const ext_chest_toggle: FeatureToggle = {
  name: '+ Breasts',
  category: 'GAMEPLAY',
  description: `
    When toggled, adds breasts to your character.
  `,
  component: CheckboxInput,
};

export const ext_chest_color: Feature<string[]> = {
  name: 'Breasts Color',
  component: FeatureTriColorInput,
};

export const ext_groin_y1_toggle: FeatureToggle = {
  name: '+ Penis',
  category: 'GAMEPLAY',
  description: `
    When toggled, adds a penis to your character.
  `,
  component: CheckboxInput,
};

export const ext_groin_y1_color: Feature<string[]> = {
  name: 'Penis Color',
  component: FeatureTriColorInput,
};

export const ext_groin_y2_toggle: FeatureToggle = {
  name: '+ Testicles',
  category: 'GAMEPLAY',
  description: `
    When toggled, adds testicles to your character.
  `,
  component: CheckboxInput,
};

export const ext_groin_y2_color: Feature<string[]> = {
  name: 'Testicle Color',
  component: FeatureTriColorInput,
};
