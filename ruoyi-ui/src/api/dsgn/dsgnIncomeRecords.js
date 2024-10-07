import request from '@/utils/request'

// 查询收入记录列表
export function listDsgnIncomeRecords(query) {
  return request({
    url: '/dsgn/dsgnIncomeRecords/list',
    method: 'get',
    params: query
  })
}

// 查询收入记录详细
export function getDsgnIncomeRecords(id) {
  return request({
    url: '/dsgn/dsgnIncomeRecords/' + id,
    method: 'get'
  })
}

// 新增收入记录
export function addDsgnIncomeRecords(data) {
  return request({
    url: '/dsgn/dsgnIncomeRecords',
    method: 'post',
    data: data
  })
}

// 修改收入记录
export function updateDsgnIncomeRecords(data) {
  return request({
    url: '/dsgn/dsgnIncomeRecords',
    method: 'put',
    data: data
  })
}

// 删除收入记录
export function delDsgnIncomeRecords(id) {
  return request({
    url: '/dsgn/dsgnIncomeRecords/' + id,
    method: 'delete'
  })
}
