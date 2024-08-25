import prompts from 'prompts'
import { filter, prepend, range, sum } from 'ramda'

const findDividers = (num) =>
  prepend(
    1,
    filter((value) => num % value === 0, range(2, num - 1))
  )

const isPerfectNumber = (num) => num !== 1 && sum(findDividers(num)) === num

const main = async () => {
  const { from, to } = await prompts([
    {
      type: 'number',
      name: 'from',
      message: 'From:'
    },
    {
      type: 'number',
      name: 'to',
      message: 'To:'
    }
  ])

  console.time('calculation')
  console.log(filter(isPerfectNumber, range(from, to)))
  console.timeEnd('calculation')
}

main()
