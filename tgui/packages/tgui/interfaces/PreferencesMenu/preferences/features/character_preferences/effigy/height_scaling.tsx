import { FeatureChoiced, FeatureNumeric, FeatureSliderInput } from '../../base';
import { FeatureDropdownInput } from '../../dropdowns';

export const height_scaling: FeatureChoiced = {
  name: 'Body Height',
  component: FeatureDropdownInput,
};

export const body_size: FeatureNumeric = {
  name: 'Body Size',
  component: FeatureSliderInput,
};
