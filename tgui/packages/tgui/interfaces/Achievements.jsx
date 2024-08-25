import { useState } from 'react';
import {
  Box,
  Flex,
  Icon,
  Image,
  ProgressBar,
  Table,
  Tabs,
  Tooltip,
} from 'tgui-core/components';

import { useBackend } from '../backend';
import { Window } from '../layouts';

export const Achievements = (props) => {
  const { data } = useBackend();
  const { categories } = data;
  const [selectedCategory, setSelectedCategory] = useState(categories[0]);
  const achievements = data.achievements.filter(
    (x) => x.category === selectedCategory,
  );
  return (
    <Window title="Achievements" width={540} height={680}>
      <Window.Content scrollable>
        <Tabs>
          {categories.map((category) => (
            <Tabs.Tab
              key={category}
              selected={selectedCategory === category}
              onClick={() => setSelectedCategory(category)}
            >
              {category}
            </Tabs.Tab>
          ))}
          <Tabs.Tab
            selected={selectedCategory === 'High Scores'}
            onClick={() => setSelectedCategory('High Scores')}
          >
            High Scores
          </Tabs.Tab>
          <Tabs.Tab
            selected={selectedCategory === 'Progress'}
            onClick={() => setSelectedCategory('Progress')}
          >
            Progress
          </Tabs.Tab>
        </Tabs>
        {(selectedCategory === 'High Scores' && <HighScoreTable />) ||
          (selectedCategory === 'Progress' && <ProgressTable />) || (
            <AchievementTable achievements={achievements} />
          )}
      </Window.Content>
    </Window>
  );
};

const AchievementTable = (props) => {
  const { achievements } = props;
  return (
    <Table>
      {achievements.map((achievement) => (
        <Achievement key={achievement.name} achievement={achievement} />
      ))}
    </Table>
  );
};

const Achievement = (props) => {
  const { achievement } = props;
  const {
    name,
    desc,
    icon_class,
    value,
    score,
    achieve_info,
    achieve_tooltip,
  } = achievement;
  return (
    <Table.Row key={name}>
      <Table.Cell collapsing>
        <Box m={1} className={icon_class} />
      </Table.Cell>
      <Table.Cell verticalAlign="top">
        <h1>{name}</h1>
        {desc}
        {(score && (
          <Box color={value > 0 ? 'good' : 'bad'}>
            {value > 0 ? `Earned ${value} times` : 'Locked'}
          </Box>
        )) || (
          <Box color={value ? 'good' : 'bad'}>
            {value ? 'Unlocked' : 'Locked'}
          </Box>
        )}
        {!!achieve_info && (
          <Tooltip position="bottom" content={achieve_tooltip}>
            <Box fontSize={0.9} opacity={0.8}>
              {achieve_info}
            </Box>
          </Tooltip>
        )}
      </Table.Cell>
    </Table.Row>
  );
};

const ProgressTable = (props) => {
  const { data } = useBackend();
  const { progresses } = data;
  const [progressIndex, setProgressIndex] = useState(0);
  const progress = progresses ? progresses[progressIndex] : null;
  if (!progress) {
    return null;
  }
  const entries = Object.keys(progress.entries).map((key) => ({
    ename: key,
    icon: progress.entries[key].icon,
    height: progress.entries[key].height,
    width: progress.entries[key].width,
  }));
  return (
    <Flex>
      <Flex.Item>
        <Tabs vertical>
          {progresses.map((progress, i) => (
            <Tabs.Tab
              key={progress.name}
              selected={progressIndex === i}
              onClick={() => setProgressIndex(i)}
            >
              {progress.name}
            </Tabs.Tab>
          ))}
        </Tabs>
      </Flex.Item>
      <Flex.Item grow={1} basis={0}>
        <ProgressBar
          ranges={{
            gold: [0.98, Infinity],
            good: [-Infinity, 0.98],
          }}
          value={progress.percent}
        >
          <Box fontSize="16px" bold>
            {progress.percent >= 0.98 && (
              <Icon name="crown" color="yellow" mr={2} />
            )}
            {progress.value_text}
            {progress.percent >= 0.98 && (
              <Icon name="crown" color="yellow" mr={2} />
            )}
          </Box>
        </ProgressBar>
        <Table>
          {entries.map((entry, i) => (
            <Table.Row key={entry.ename} className="candystripe">
              <Table.Cell>
                <Image
                  src={`data:image/jpeg;base64,${entry.icon}`}
                  height={`${entry.height}px`}
                  width={`${entry.width}px`}
                />
              </Table.Cell>
              <Table.Cell>
                <Box fontSize="16px">
                  {entry.ename}
                </Box>
              </Table.Cell>
            </Table.Row>
          ))}
        </Table>
      </Flex.Item>
    </Flex>
  );
};

const HighScoreTable = (props) => {
  const { data } = useBackend();
  const { highscore: highscores, user_ckey } = data;
  const [highScoreIndex, setHighScoreIndex] = useState(0);
  const highscore = highscores ? highscores[highScoreIndex] : null;
  if (!highscore) {
    return null;
  }
  const scores = Object.keys(highscore.scores).map((key) => ({
    ckey: key,
    value: highscore.scores[key],
  }));
  return (
    <Flex>
      <Flex.Item>
        <Tabs vertical>
          {highscores.map((highscore, i) => (
            <Tabs.Tab
              key={highscore.name}
              selected={highScoreIndex === i}
              onClick={() => setHighScoreIndex(i)}
            >
              {highscore.name}
            </Tabs.Tab>
          ))}
        </Tabs>
      </Flex.Item>
      <Flex.Item grow={1} basis={0}>
        <Table>
          <Table.Row header>
            <Table.Cell textAlign="center">#</Table.Cell>
            <Table.Cell textAlign="center">Key</Table.Cell>
            <Table.Cell textAlign="center">Score</Table.Cell>
          </Table.Row>
          {scores.map((score, i) => (
            <Table.Row key={score.ckey} className="candystripe" m={2}>
              <Table.Cell color="label" textAlign="center">
                {i + 1}
              </Table.Cell>
              <Table.Cell
                color={score.ckey === user_ckey && 'green'}
                textAlign="center"
              >
                {i === 0 && <Icon name="crown" color="yellow" mr={2} />}
                {score.ckey}
                {i === 0 && <Icon name="crown" color="yellow" ml={2} />}
              </Table.Cell>
              <Table.Cell textAlign="center">{score.value}</Table.Cell>
            </Table.Row>
          ))}
        </Table>
      </Flex.Item>
    </Flex>
  );
};
