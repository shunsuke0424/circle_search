# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'
# 開発用のテストデータ

if Keyword.count.zero?
  instances = CSV.open('db/keyword.csv', headers: true).to_a.map do |row|
    {
      content: row['content'],
      created_at: Time.now,
      updated_at: Time.now
    }
  end
  Keyword.insert_all instances
end

if Athletic.count.zero?
  instances = CSV.open('db/athletic_category.csv', headers: true).to_a.map do |row|
    {
      name: row['name'],
      created_at: Time.now,
      updated_at: Time.now
    }
  end
  Athletic.insert_all instances
end

if Culture.count.zero?
  instances = CSV.open('db/culture_category.csv', headers: true).to_a.map do |row|
    {
      name: row['name'],
      created_at: Time.now,
      updated_at: Time.now
    }
  end
  Culture.insert_all instances
end

if Art.count.zero?
  instances = CSV.open('db/art_category.csv', headers: true).to_a.map do |row|
    {
      name: row['name'],
      created_at: Time.now,
      updated_at: Time.now
    }
  end
  Art.insert_all instances
end

if Rails.env.development?

  athletics = Athletic.all.index_by(&:name)
  cultures = Culture.all.index_by(&:name)
  arts = Art.all.index_by(&:name)

  company_hashes = [
    {
      name: '体育会硬式テニス部',
      athletic_name: 'テニス',
      place: '体芸テニスコート',
      number: 42,
      company_category: 'athletic',
      keywords: ['愛らしい'],
      detail: '硬式テニス部は毎日活動しています。',
      images_path: 'img/012.png',
      frequency: 5,
      activity_day: 'monday',
      sns_link: 'https://whimsical.com/cojt-Nw2ZFFmDUCdTVdVPZmS4NW',
    },
    {
      name: 'ヘンゼルとグレーテル',
      culture_name: '料理',
      place: '文化大佐館',
      number: 6,
      company_category: 'culture',
      keywords: ['おもろい','かしましい','かたい'],
      detail: '美味しいお菓子を作りましょう！！',
      images_path: 'img/012122.png',
      frequency: 2,
      activity_day: 'sunday',
      sns_link: 'https://whimsical.com/cojt-jiijNw2ZFFmDUCdTVdVPZmS4NW',
    },
    {
      name: 'Neoplis BIGBAND',
      culture_name: 'ジャズ',
      place: '文化大佐館',
      number: 2,
      company_category: 'art',
      keywords: ['楽しい','ヤリサー','上下ない'],
      detail: '筑波大学Neoplis BIGBAND（ネオポリス ビッグバンド）は、2015年10月から活動をしている、筑波大学のビッグバンドサークル(サークル名：筑波大学ジャズ楽団Neopolis BIGBAND)です。
      大学1年生から大学院生の約40人のメンバーで、ビッグバンド・ジャズの探求、筑波大学及び周辺地域の音楽文化の普及と振興を目的として、主につくば周辺や茨城県内での演奏活動を行っています。
      ビッグバンドとは、サックス、トランペット、トロンボーン、ドラム、ベース、ギター、ピアノ、ボーカルで構成されるジャズの大編成の演奏形態のことです。Neopolis BIGBANDには、他の大学ビッグバンドではあまり見られないボーカリストが所属しており、特徴の一つです。',
      images_path: 'img/012122.png',
      frequency: 2,
      activity_day: 'sunday',
      sns_link: 'https://whimsical.com/cojt-jiijNw2ZFFmDUCdTVdVPZmS4NW',
    },
    {
      name: '津軽三味線倶楽部無弦塾',
      culture_name: '伝統芸能',
      place: '文化大佐館',
      number: 6,
      company_category: 'art',
      keywords: ['明るい','楽しい','元気良い'],
      detail: '私達は月・水・土の週３回、開学記念館にて
      「明るく，楽しく，元気よく」そして「いつも一生懸命」
      をモットーに和気藹々と活動しています。',
      images_path: 'img/012122.png',
      frequency: 2,
      activity_day: 'sunday',
      sns_link: 'https://whimsical.com/cojt-jiijNw2ZFFmDUCdTVdVPZmS4NW',
    },
    {
      name: 'ヘンゼルとグレーテル2',
      culture_name: '料理',
      place: '文化大佐館',
      number: 6,
      company_category: 'culture',
      keywords: ['おもろい','かしましい','かたい'],
      detail: '美味しいお菓子を作りましょう！！',
      images_path: 'img/012122.png',
      frequency: 2,
      activity_day: 'sunday',
      sns_link: 'https://whimsical.com/cojt-jiijNw2ZFFmDUCdTVdVPZmS4NW',
    },
    {
      name: 'ヘンゼルとグレーテル3',
      culture_name: '料理',
      place: '文化大佐館',
      number: 6,
      company_category: 'culture',
      keywords: ['おもろい','かしましい','かたい'],
      detail: '美味しいお菓子を作りましょう！！',
      images_path: 'img/012122.png',
      frequency: 2,
      activity_day: 'sunday',
      sns_link: 'https://whimsical.com/cojt-jiijNw2ZFFmDUCdTVdVPZmS4NW',
    },
    {
      name: 'ヘンゼルとグレーテル4',
      culture_name: '料理',
      place: '文化大佐館',
      number: 6,
      company_category: 'culture',
      keywords: ['おもろい','かしましい','かたい'],
      detail: '美味しいお菓子を作りましょう！！',
      images_path: 'img/012122.png',
      frequency: 2,
      activity_day: 'sunday',
      sns_link: 'https://whimsical.com/cojt-jiijNw2ZFFmDUCdTVdVPZmS4NW',
    }
  ]
  company_hashes.each do |hash|
    company = Company.find_or_initialize_by(name: hash[:name])
    company.company_keywords = hash[:keywords].to_a.map do |content|
      keyword = Keyword.create_or_find_by(content: content)
      company.company_keywords.build(keyword: keyword)
    end
    company.update!(
      athletic: athletics[hash[:athletic_name]],
      art: arts[hash[:art_name]],
      culture: cultures[hash[:culture_name]],
      number: hash[:number],
      company_category: hash[:company_category],
      place: hash[:place],
      detail: hash[:detail],
      images_path: hash[:images_path],
      frequency: hash[:frequency],
      activity_day: hash[:activity_day],
      sns_link: hash[:sns_link],
    )
  end
end