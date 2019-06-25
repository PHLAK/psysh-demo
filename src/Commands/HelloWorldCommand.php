<?php

namespace PHLAK\Stash\Commands;

use Psy\Command\Command;
use Symfony\Component\Console\Input\InputArgument;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;

class HelloWorldCommand extends Command
{
    protected function configure()
    {
        $this
            ->setName('hello')
            ->setDefinition([
                new InputArgument('someone', InputArgument::REQUIRED, 'Someone to greet.'),
            ])
            ->setDescription('Example ')
            ->setHelp('Echos "Hello <something>!"');
    }

    protected function execute(InputInterface $input, OutputInterface $output)
    {
        $output->write("Hello <info>{$input->getArgument('someone')}</info>!", true);
    }
}
