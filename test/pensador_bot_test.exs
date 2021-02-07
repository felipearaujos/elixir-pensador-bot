defmodule PensadorBot.CrawlerTest do
  use ExUnit.Case

  @posible_phrases [
    [
      "Tudo depende do jeito em que você decifra as coisas, até o lugar mais feio se torna lindo quando o por do sol se encontra ao brilho do mar.... Frase de Letícia Haag."
    ],
    [
      "Essa juventude materialista ainda vai precisar escutar as batidas do coração para encontrar paz nessa vida. Porque o objeto não proporciona a real felicidade...... Frase de Peregrino Corrêa."
    ],
    [
      "Não pronuncie ou especule a vida do próximo de forma enxorvalhada.\nNara Nubia Alencar Queiroz @narinha.164... Frase de NARA NUBIA ALENCAR QUEIROZ."
    ],
    ["Tanta gente marca a gente.... Frase de Franklin S. Carter."],
    [
      "Quem diria\nMeu sonho era dormir e acordar ao seu lado\nViajar na imensidão de seu primeiro olhar\nAssim foi, cometas e estrelas\nAté que um dia tudo mudou\nAmanhece... Frase de Daniel Avancini Araujo."
    ],
    [
      "A vida passa e a idade vai nos aproximando do que realmente importa.... Frase de Josane Hodniki."
    ],
    [
      "A vida é incrível e perfeita, da sua maneira.\nEstamos no lugar certo, na hora certa e hoje nunca foi ontem, nem vai ser amanhã.\nHoje é hoje. E é pra todos!... Frase de Josane Hodniki."
    ],
    [
      "A vida é um lugar onde amizades e amores são muito mais do que aplausos, glória e dinheiro, ela é o prêmio dos personagens que se aninharam neste oásis de felic... Frase de Lucimauro Corrêa."
    ],
    [
      "ೋ ✿ Cada detalhe é um capricho de Deus para nos fazer sorrir , nos tocar com carinho e doçura o coração !\nBasta se permitir sentir e ser bem mais feliz ! • ♡\nೋ ... Frase de Liahna Mell."
    ],
    [
      "Sempre me disseram pra nunca virar as costas para as pessoas. Não faço isso, mas é sarcasmo, não é? Os tiros e as facadas continuam vindo de todos os lados.... Frase de Emerson Mollin."
    ],
    [
      "Meu bem, você fez tantas idas e vindas, que acabei dando a volta no mundo com essa porcaria de amor. E que bela porcaria.... Frase de Emerson Mollin."
    ],
    [
      "Hoje cedo eu li num jornal: a vida não é para todos. Então, deixei ele de lado, deitei-me num manto de frustração e refiz as palavras. Logo após levantei-me e r... Frase de Emerson Mollin."
    ],
    [
      "Em cada memória encontramos um pouco do que deixamos partir, dos amores que carregaram lágrimas para longe e das dores que provaram o verdadeiro instinto humano... Frase de Emerson Mollin."
    ],
    [
      "Amor. Palavra esquisita essa, algo que ilude, algo que não se conhece, algo que se aprende. E apesar de tudo, algo chamado amor, pequenos detalhes de felicidade... Frase de Emerson Mollin."
    ],
    [
      "O mesmo tempo que uma vez criou feridas há de fazê-las cicatrizar.... Frase de Emerson Mollin."
    ],
    [
      "Dizer que não conseguimos é simplesmente fácil, mas sequer conseguimos olhar para nosso interior e descobrir o que fazer e como fazer, queremos possuir um porto... Frase de Emerson Mollin."
    ],
    [
      "Não existem monumentos em minha homenagem, nem mesmo canções em meu nome, mas reconheço no mais sublime amanhecer que o pesar dos sentimentos e o clarear das em... Frase de Emerson Mollin."
    ],
    [
      "Não posso definir o peso das correntes que cercam minhas mãos, muito menos definir o amor que irei receber do mundo, embora simplesmente acredito que a vida não... Frase de Emerson Mollin."
    ],
    [
      "Não. Não sinta dó.\nSinta amor.\nÉ isso que falta nas pessoas.... Frase de Emerson Mollin."
    ],
    [
      "Te adoro. Não vejo a hora de estar naquele nosso envolvimento. No momento, no incremento, sem aumento.... Frase de João Esty."
    ]
  ]

  test "assert possible phrase" do
    phrase = PensadorBot.Crawler.start()

    assert phrase in @posible_phrases
  end
end
